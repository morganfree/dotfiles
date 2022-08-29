#!/bin/sh

set -e

#input="$(mktemp)"

#trap 'rm -f $input' EXIT
#-q '[ .data.repository.projects.nodes[].columns.nodes[].cards.nodes[].content | select(.assignees.nodes[].login == "sdomas-cksource") | {id: .number,title: .title,body: .body} ]' \

#q='[.data.viewer.login as $me | .data.repository.projects.nodes[].columns.nodes[].cards.nodes[].content | select(any(.assignees.nodes[].login; . == $me)) | {id: .number, title, body}]'
#.data.viewer.login as $me
#	| .data.repository.projects.nodes[].columns.nodes[].cards.nodes[].content
#	| select(any(.assignees.nodes[].login; . == $me))
#	| [ .number, .title, ( .body | @base64 ) ]
#	| join("\t")'

# shellcheck disable=SC2016
gh api graphql \
	-F owner='{owner}' \
	-F name='{repo}' \
	-f query='
query($name: String!, $owner: String!) {
	viewer { login }
	repository(owner: $owner, name: $name) {
		projects(last: 2, states: OPEN) {
			nodes {
				number
				name
				columns(first: 10) {
					nodes {
						name
						cards {
							nodes {
								content {
									... on Issue {
										number
										title
										bodyText
										body
										assignees(first: 100) {
											nodes {
												login
											}
										}
									}
								}
							}
						}
					}
				}
			}
			pageInfo { hasNextPage, endCursor }
		}
	}
}
' \
	-q '
.data.viewer.login as $me
	| .data.repository.projects.nodes[].columns.nodes[].cards.nodes[].content
	| select(any(.assignees.nodes[].login; . == $me))
	| "\(.number)\t\(.title)\t\( .body | @base64 )"
' \
	| fzf -d'\t' --with-nth=1,2 --preview='echo \"{3}\" | jq -r "@base64d" | fold -w "$COLUMNS"'

#	| fzf -d'\t' --with-nth=1,2 --preview='echo $COLUMNS'


#	> "$input"

#jq -r '.[] | [ .id,.title ] | join("\t")' "$input" | fzf +m --select-1 --preview="jq -r '.[] | select(.id == {1}) | .body' ${input}" | cut -f 1
