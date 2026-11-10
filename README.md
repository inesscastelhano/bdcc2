# P2 | Build and repair the transaction validator
Work in pairs in a Docker-enabled Codespace. Open a Bash terminal in the folder containing this README. Switch who types after the first build. Follow this sheet with your instructor.

## 1. See what you are building
Run the commands below one at a time. The first creates a named image. The second starts a container from that image and asks the validator to print its command-line options.
```bash
docker build -t bdcc-validator:p2 .
docker run --rm bdcc-validator:p2 --help
```
Find the options for the input CSV, output folder and run name.

## 2. Write the packaging instructions together
Open Dockerfile.starter. The base image, working directory and default arguments are already there. Replace the two comment lines as your instructor demonstrates. Run the first command again **with the starter filename** so Docker builds the file you just edited.
```bash
docker build -f Dockerfile.starter -t bdcc-validator:p2 .
docker run --rm bdcc-validator:p2 --help
```
Keep your edited Dockerfile.starter as your working Docker configuration.

## 3. Find the transaction that slipped through
Open input/counter_cases.csv. Find D. Use the transaction ID and customer ID to decide whether D belongs in accepted.csv. Now open run.sh. Find the lines connecting the host input and output folders to /input and /output. Run the small file.
```bash
bash run.sh counter_cases.csv before
```
Open output/before/accepted.csv and output/before/rejected.csv. Where did D go? Look for the first condition in reason(row) inside validate.py. With your partner, describe the rule that should send D to the rejection log. Edit this condition and save the file.

## 4. Predict, rebuild and verify
Run with the edited source and the existing image first. Predict D's destination.
```bash
bash run.sh counter_cases.csv edited
```
Now rebuild your image from your edited Dockerfile, then run again.
```bash
docker build -f Dockerfile.starter -t bdcc-validator:p2 .
bash run.sh counter_cases.csv fixed
```
Compare before, edited and fixed. Which record moved? Which exclusion reason does it have? Why did the middle run still use the old rule?

## 5. Process January and check the P1 report
```bash
bash run.sh transactions_initial.csv initial
```
Download accepted.csv, rejected.csv, duplicates.csv and run_record.json from output/initial. Upload them into p2/initial in your existing P1 p1_files Volume. Import P2_handover.ipynb. Set the catalog and schema you used in P1 and run the notebook. Compare the figures to your P1 report.

Keep the edited Dockerfile.starter and validate.py together with the cleaned file, the rejection log and run record. When repeating a demo in the same project folder, pick a new run name for each command. Each completed run keeps its own output directory.

**Exit question.** Tomorrow the input file changes. Next week the validation code changes. Which of those changes requires rebuilding today's image, and why?
