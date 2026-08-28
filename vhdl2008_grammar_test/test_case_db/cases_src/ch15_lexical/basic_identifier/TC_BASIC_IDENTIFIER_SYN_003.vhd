-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Positive
-- Test Focus: basic_identifier with multiple underscore-separated segments(my_data_bus_width) — underline joins multiple letter_or_digit segments, verify underscores are legal separators in the identifier body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bid_multi_underscore is
  port (
    bus_val : out integer
  );
end entity bid_multi_underscore;

architecture rtl of bid_multi_underscore is
  constant my_data_bus_width : integer := 32;
  signal current_word_count  : integer := 0;
begin
  current_word_count <= my_data_bus_width;
  bus_val <= current_word_count;
end architecture rtl;
