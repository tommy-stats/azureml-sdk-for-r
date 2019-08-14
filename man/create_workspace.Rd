% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workspace.R
\name{create_workspace}
\alias{create_workspace}
\title{Create a new Azure Machine Learning Workspace}
\usage{
create_workspace(name, subscription_id = NULL, resource_group = NULL,
  location = NULL, create_resource_group = TRUE,
  friendly_name = NULL, storage_account = NULL, key_vault = NULL,
  app_insights = NULL, container_registry = NULL, exist_ok = FALSE,
  show_output = TRUE)
}
\arguments{
\item{name}{The new workspace name. Workspace name has to be between
2 and 32 characters of letters and numbers.}

\item{subscription_id}{The subscription ID of the containing subscription
for the new workspace. The parameter is required if the user has access to
 more than one subscription.}

\item{resource_group}{The Azure resource group that is containing the
workspace. The parameter defaults to a mutation of the workspace name.}

\item{location}{The location of the workspace. The parameter defaults to
the resource group location. The location has to be a supported region for
Azure Machine Learning Services.}

\item{create_resource_group}{When true the resource group will be created
if it doesn't exist.}

\item{friendly_name}{A friendly name for the workspace that can be displayed
in the UI.}

\item{storage_account}{An existing storage account in the Azure resource ID
format. The storage will be used by the workspace to save run outputs, code,
 logs etc. If None a new storage will be created.}

\item{key_vault}{An existing key vault in the Azure resource ID format.
The Key vault will be used by the workspace to store credentials added to
the workspace by the users. If None a new key vault will be created.}

\item{app_insights}{An existing Application Insights in the Azure resource
ID format. The Application Insights will be used by the workspace to log
webservices events. If None a new Application Insights will be created.}

\item{container_registry}{An existing Container registery in the Azure
resource ID format. The Container registery will be used by the workspace
to pull and push both experimentation and webservices images. If None a new
Container registery will be created.}

\item{exist_ok}{If TRUE the method will not fail if the workspace already
exists.}

\item{show_output}{If TRUE the method will print out incremental progress of
method.}
}
\description{
Create a new Azure Machine Learning Workspace
}