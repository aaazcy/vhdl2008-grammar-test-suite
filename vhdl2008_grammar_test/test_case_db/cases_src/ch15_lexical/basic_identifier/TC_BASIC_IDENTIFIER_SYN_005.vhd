-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Positive
-- Test Focus: various naming styles of basic_identifier coexisting in the same architecture — all uppercase(MAX_WIDTH), all lowercase(min_val), mixed case(DataBus), single letter + digit(X1, Y2), verify multiple legal identifier styles
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bid_mixed_styles is
  port (
    r : out integer
  );
end entity bid_mixed_styles;

architecture rtl of bid_mixed_styles is
  constant MAX_WIDTH : integer := 64;
  signal DataBus     : integer := 0;
  signal X1          : integer := 1;
  signal Y2          : integer := 2;
begin
  DataBus <= X1 + Y2;
  r <= DataBus;
end architecture rtl;
