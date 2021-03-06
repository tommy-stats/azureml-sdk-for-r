# Copyright(c) Microsoft Corporation.
# Licensed under the MIT license.

suppressMessages(library(shiny))
suppressMessages(library(DT))


server <- function(input, output, session) {
  
  values <- reactiveValues(widget_state = "initializing",
                           current_run = NULL)

  # retrieve run object once widget_state
  observeEvent(values$widget_state == "streaming", {
    ws <- azuremlsdk::get_workspace(ws_name, subscription_id, rg)
    exp <- azuremlsdk::experiment(ws, exp_name)
    values$current_run <- azuremlsdk::get_run(exp, run_id)
  },
  ignoreInit = TRUE,
  once = TRUE)

  # stop app if user closes session
  session$onSessionEnded(function() {
    shiny::stopApp()
  })
  
  plot <- function() {
    if(isolate(values$widget_state) %in% c("initializing", "streaming")) {
      invalidateLater(10000, session)
    }
  
    if (!is.null(values$current_run)) {
      run_details_plot <- azuremlsdk::view_run_details(values$current_run,
                                                       auto_refresh = FALSE)
      if (isolate(values$widget_state == "streaming") &&
          values$current_run$status %in% c("Canceled", "Completed", "Failed")) {
        values$widget_state <- "finalizing"
        print("Your run has reached a terminal state. You may close the widget now.")
      }
    } else {
      # initialize auto-refresh 10 seconds after job submitted
      if (isolate(values$widget_state == "initializing") &&
          difftime(Sys.time(), start_time, units = "secs") > 10) {
        values$widget_state <- "streaming"
      }      
    }

    return(run_details_plot)
  }
  
  output$runDetailsPlot <- DT::renderDataTable({
    plot()
  })
}

ui <- fluidPage(
  dataTableOutput("runDetailsPlot")
)

shiny::runApp(shinyApp(ui, server), port = port)
