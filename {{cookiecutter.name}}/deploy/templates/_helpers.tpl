{{ "{{" }}/*
Expand the name of the chart.
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.name" -{{ "}}" }}
{{ "{{" }}- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}

{{ "{{" }}/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.fullname" -{{ "}}" }}
{{ "{{" }}- if .Values.fullnameOverride {{ "}}" }}
{{ "{{" }}- .Values.fullnameOverride | trunc 63 | trimSuffix "-" {{ "}}" }}
{{ "{{" }}- else {{ "}}" }}
{{ "{{" }}- $name := default .Chart.Name .Values.nameOverride {{ "}}" }}
{{ "{{" }}- if contains $name .Release.Name {{ "}}" }}
{{ "{{" }}- .Release.Name | trunc 63 | trimSuffix "-" {{ "}}" }}
{{ "{{" }}- else {{ "}}" }}
{{ "{{" }}- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}

{{ "{{" }}/*
Create chart name and version as used by the chart label.
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.chart" -{{ "}}" }}
{{ "{{" }}- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}

{{ "{{" }}/*
Common labels
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.labels" -{{ "}}" }}
helm.sh/chart: {{ "{{" }} include "{{cookiecutter.name}}.chart" . {{ "}}" }}
{{ "{{" }} include "{{cookiecutter.name}}.selectorLabels" . {{ "}}" }}
{{ "{{" }}- if .Chart.AppVersion {{ "}}" }}
app.kubernetes.io/version: {{ "{{" }} .Chart.AppVersion | quote {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}
app.kubernetes.io/managed-by: {{ "{{" }} .Release.Service {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}

{{ "{{" }}/*
Selector labels
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.selectorLabels" -{{ "}}" }}
app.kubernetes.io/name: {{ "{{" }} include "{{cookiecutter.name}}.name" . {{ "}}" }}
app.kubernetes.io/instance: {{ "{{" }} .Release.Name {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}

{{ "{{" }}/*
Create the name of the service account to use
*/{{ "}}" }}
{{ "{{" }}- define "{{cookiecutter.name}}.serviceAccountName" -{{ "}}" }}
{{ "{{" }}- if .Values.serviceAccount.create {{ "}}" }}
{{ "{{" }}- default (include "{{cookiecutter.name}}.fullname" .) .Values.serviceAccount.name {{ "}}" }}
{{ "{{" }}- else {{ "}}" }}
{{ "{{" }}- default "default" .Values.serviceAccount.name {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}
{{ "{{" }}- end {{ "}}" }}
