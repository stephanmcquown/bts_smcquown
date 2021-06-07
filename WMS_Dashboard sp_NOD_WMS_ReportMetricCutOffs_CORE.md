
# General Info

- This compares when an order was sent to the warehouse to pick (PId) vs cut-off times vs when the order was finalized
- If the order was NOT finalized AND the order was PId prior to cut-off, then the order is late
- RSV_ORDER and ORDER_OPEN tables have applicable
- Tables capture date times in PST
- The cut-offs use PST also

# Logic Skeleton

- Get order metrics from RSV_ORDER and ORDER_OPEN
- Get Warehouse cut-offs by ship via
- Get the calendar.  If the order come in on non-biz day, cut-off is pushed to next biz day.  Create a next biz date column to ease logic comparing current to next biz date
- Update order metrics
- Compare the pick date times with the cut-offs vs finalized times

