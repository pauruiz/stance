# Stance test

## Build and run instructions

It was build using latest Xcode (15.4 at this moment), and chosen latest iOS version.

No third dependencies, so only opening the project and run would be enough.

## Summary of implementation decisions
On the data part, used Codable to be able to fetch the data easily, together with Combine and Chart would be more than enough to finish this test

On the UI part, chose to have a view model, that used a Network service to fetch the data, I was unable to create the chart, or even get a real data, so tried to generate fake data to be able to generate a graph while investigating the reason the JSONDecoder was unable to bring proper data.

I tried to have separated the View, the ViewModel, and the Netowrk layer, although it was a bit difficult in the short time

## Total time spent
Almost the two hours
