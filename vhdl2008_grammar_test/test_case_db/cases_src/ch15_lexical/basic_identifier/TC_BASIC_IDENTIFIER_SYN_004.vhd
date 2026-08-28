-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Case Type: Positive
-- Test Focus: basic_identifier starting with a letter followed by multiple digits(addr32, data16, sig0): verify letters followed directly by digits (no underscore) are legal as identifiers, identifiers ending in digits
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bid_letter_then_digits is
  port (
    a32 : out integer;
    d16 : out integer
  );
end entity bid_letter_then_digits;

architecture rtl of bid_letter_then_digits is
  signal addr32 : integer := 32;
  signal data16 : integer := 16;
  signal sig0   : integer := 0;
begin
  a32 <= addr32;
  d16 <= data16;
  sig0 <= 0;
end architecture rtl;
