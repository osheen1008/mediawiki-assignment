{{/*
Mediawiki Chart
*/}}
{{- define "mediawiki.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Mediawiki functions
*/}}

{{- define "mediawiki.labels" -}}
helm.sh/chart: {{ include "mediawiki.chart" . }}
{{ include "mediawiki.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "mediawiki.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.mediawiki.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
MariaDB functions
*/}}

{{- define "mariadb.labels" -}}
helm.sh/chart: {{ include "mediawiki.chart" . }}
{{ include "mariadb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "mariadb.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.mariadb.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

---

