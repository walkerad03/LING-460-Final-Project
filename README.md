# LING 460 Final Project

Data and files related to Group 11's Final Project for LING 460

## Raw Data Schema

| Name | Type | Description | Example |
| ---- | ---- | ----------- | ------- |
| **Cycle.start.time** | `string` | Start time for all data taken throughout a day. | 2023-03-21 23:04:14 |
| **Cycle.end.time** | `string` | End time for all data taken throughout a day. | 2023-03-22 22:26:19 |
| **Cycle.timezone** | `string` | Timezone where the data was taken. | UTC-04:00 |
| **Recovery.score..** | `integer` | Numerical score from 1-100 which dictates a general aerobic recovery. 50 is considered a baseline. | 50 |
| **Resting.heart.rate..bpm.** | `integer` `[beats/minute]` | Average heartrate during sleep. | 54 |
| **Heart.rate.variability..ms.** | `integer` `[milliseconds]` | Heart Rate Variability during sleep. | 70 |
| **Skin.temp..celsius.** | `double` `[celsius]` | Average skin temperature during sleep | 34.5 |
| **Blood.oxygen..** | `double` | Blood Oxygen Percentage during sleep | 97.24 |
| **Day.Strain** | `double` | Numerical strain value from measured from 0 to 21.0. This is measured on a log scale so strain values become harder to achieve as one gets closer to 21. A 21.0 strain value would indicate that the person has sustained their maximum heart rate for a full 24 hours. | 16.5 |
| **Energy.burned..cal.** | `integer` `[calories]` | Energy burned over a day | 3057 |
| **Max.HR..bpm.** | `integer` `[beats/minute]` | Maximum recorded heart rate over a day | 170 |
| **Average.HR..bpm.** | `integer` `[beats/minute]` | Average recorded heart rate over a day | 78 |
| **Sleep.onset** | `string` | Time the subject began going to sleep for the night. This time should be considered the time when the subject got into bed, not when the actually fell asleep. | 2023-03-21 23:04:14 |
| **Wake.onset** | `string` | Time the subject got out of bed in the morning. This is not the same as the wake-up time. | 2023-03-22 5:14:49 |
| **Sleep.performance..** | `integer` | The ratio of hours of sleep the subject got to the hours of sleep the subject needed. Measured from 0% to 100%. | 57 |
| **Respiratory.rate..rpm.** | `double` `[breaths / minute]` | Average breath rate during sleep | 14.7 |
| **Asleep.duration..min.** | `integer` `[minutes]` | Total time asleep | 357 |
| **In.bed.duration..min.** | `integer` `[minutes]` | Total time in bed | 370 |
| **Light.sleep.duration..min.** | `integer` `[minutes]` | Total time spent in "light sleep." This is considered by Whoop as the transitional time between being fully asleep and awake, or vice versa. | 226 |
| **Deep..SWS..duration..min.** | `integer` `[minutes]` | Total time spent in Deep/Slow Wave Sleep. | 79 |
| **REM.duration..min.** | `integer` `[minutes]` | Total time spent in Rapid Eye Movement Sleep. | 52 |
| **Awake.duration..min.** | `integer` `[minutes]` | Total time spent awake in bed. | 13 |
| **Sleep.need..min.** | `integer` `[minutes]` | Calculated sleep need. Based on previous day strain, sleep debt, recent naps, and a predetermined baseline | 628 |
| **Sleep.debt..min.** | `integer` `[minutes]` | Sleep debt. Total amount of sleep needed to "get back on track" | 100 |
| **Sleep.efficiency..** | `integer` | Ratio of time asleep to time in bed. This is on a scale from 0% to 100%. | 97 |

## Sources of Data

Whoop fitness trackers worn by anonymous people