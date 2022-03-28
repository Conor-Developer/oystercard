## Getting started

1) git clone path-to-repo
2) Install bundler via `gem install bundle` (if you don't have bundler already)
3) Install dependencies via `bundle`


## Test Code

Run rspec from the main directory to test the code and check coverage

## Run

Run code using irb

`require './lib/airport'`
`require './lib/plane'`

## User Stories, Domain Models and Mermaid Diagrams

`In order to use public transport
As a customer
I want money on my card`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| Person  |                        |
| Oystercard  |      balance    |

```mermaid
graph TD
    A[Person] -->B[Oystercard]
    B[Oystercard] -->C[balance]
```

`In order to keep using public transport
As a customer
I want to add money to my card`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| Person  |                        |
| Oystercard  |      top up    |

```mermaid
graph TD
    A[Person] -->B[Oystercard]
    B[Oystercard] -->C[top up]
```

`In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

|  Objects        |  Messages      |
| ----------      | -------------  | 
| Person  |                        |
| Oystercard  |      top up   |

```mermaid
graph TD
    A[Person] -->B[Oystercard]
    B[Oystercard] -->C[top up]
    C[top up] -->|True|D[balance increase]
    C[top] -->|False|E[raise error]
```


`In order to pay for my journey
As a customer
I need my fare deducted from my card`

|  Objects        |  Messages      |
| ----------      | -------------  | 
| Person  |                        |
| Oystercard  |      deduct   |

```mermaid
graph TD
    A[Person] -->B[Oystercard]
    B[Oystercard] -->C[deduct]
```

`In order to get through the barriers.
As a customer
I need to touch in and out.`


|  Objects        |  Messages      |
| ----------      | -------------  | 
| Person  |                        |
| Oystercard  |      touch_in, touch_out, in_journey?   |

```mermaid
graph TD
    A[Person] -->B[Oystercard]
    B[Oystercard] -->C[touch_in]
    B[Oystercard] -->D[touch_out]
    C[touch_in] --> E[in_journey?]
    E[in_journey?] -->|true|B[Oystercard]
    D[touch_out] --> F[in_journey?]
    F[in_journey?] -->|false|B[Oystercard]
```