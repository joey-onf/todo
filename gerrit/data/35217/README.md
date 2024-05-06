Use latest SCA-COMMON image for VOLTHA for JAVA/GO/Python Repositories

timeout=10 (error msg="Timeout exceeded)
----------------------------------------

- https://gerrit.opencord.org/c/voltha-go-controller/+/35217

- ![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png) - PASS

    - https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/237/consoleFull

- ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) - FAIL

    - https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/265/consoleText
    - https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/264/consoleText

Log Compare
-----------

- Comon elements:

    - 07:52:42 Status: Downloaded newer image for voltha/voltha-ci-tools:2.4.0-golangci-lint

- [327](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/237/consoleFull)

    - 07:55:20 level=info msg="[runner/goanalysis_metalinter/goanalysis] analyzers took 1m29.279125896s with top 10 stages: buildssa: 54.058792647s, goimports: 6.895311733s, fact_purity: 5.195693482s, gofmt: 3.717647818s, gosec: 3.638459206s, whitespace: 3.344714563s, inspect: 3.290993071s, ineffassign: 1.59364877s, ctrlflow: 1.50416911s, misspell: 1.462021693s"

- [265](https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/265/consoleText)

- 04:02:17 level=info msg="[runner/goanalysis_metalinter/goanalysis] analyzers took 4m23.288271345s with top 10 stages: buildssa: 1m10.544536832s, goimports: 37.227482004s gofmt: 21.910770424s, gosec: 20.27851237s, whitespace: 19.174731834s, ineffassign: 13.449203201s, misspell: 12.588779914s, inspect: 4.781534279s, SA4000: 3.743781118s, shadow: 3.687116567s"

| What                                    | PASS     | FAIL     | Notes      |
| --------------------------------------- | -------- | -------- | ---------- |
| runner/goanalysis_metalinter/goanalysis | 1m29.279 | 4m23.288 | +3 minutes | buildssa | 54.058792647s |
| buildssa     | 54.058792647s  | 1m10.544536832s | | 
| goimports    | 6.895311733s   | 37.227482004s   | | 
| fact_purity  | 5.195693482s   |                 | |
| gofmt        | 3.717647818s   | 21.910770424s   | |
| gosec        | 3.638459206s   | 20.27851237s    | |
| whitespace   | 3.344714563s   | 19.174731834s   | |
| inspect      | 3.290993071s   | 4.781534279s    | |
| ineffassign  | 1.59364877s    | 13.449203201s   | |
| ctrlflow     | 1.50416911s    |                 | |
| misspell     | 1.462021693s   | 12.588779914s   | |
| SA4000       |                | 3.743781118s    | |
| shadow       |                | 3.687116567s    | |
| Execution took | 6m4.972264423s | 6m4.972264423s | |
| *1* msg="[runner] processing took ' | 22.656844ms | 198.838419ms | |
| *1* nolint | 20.628318ms | 163.802257ms | |
| [runner] linters took | 1m37.684736425s | 2m19.246703223s | |

**NOTE ** - Passing job 237 contains &lt;testsuite&gt; job 265 does not


237
---

- 07:55:26 level=info msg="[runner] linters took 1m37.684736425s with stages: goanalysis_metalinter: 1m31.821743324s, unused: 5.837246218s"
- 07:55:26 &lt;testsuites&gt; &lt;/testsuites&gt; level=info msg="File cache stats: 171 entries of total size 1.9MiB"
- ** 07:55:26 level=info msg="Memory: 1116 samples, avg is 184.3MB, max is 744.1MB" **
- 07:55:26 level=info msg="Execution took 2m42.195509347s"

265
---

- 04:02:47 level=info msg="File cache stats: 171 entries of total size 1.9MiB"
- ** 04:02:47 level=error msg="Timeout exceeded: try increase it by passing --timeout option" **
- 04:02:48 Makefile:106: recipe for target 'sca' failed
