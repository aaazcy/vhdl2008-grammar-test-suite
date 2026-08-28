-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Positive
-- Test Focus: digit branch — digits embedded in identifiers as non-first character parts of letter_or_digit, such as addr1, bus32
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity lod_digits_in_id is
  port (
    bus0    : out integer;
    bus1    : out integer;
    addr32  : out integer
  );
end entity lod_digits_in_id;

architecture rtl of lod_digits_in_id is
  signal reg0 : integer := 0;
  signal reg1 : integer := 1;
  signal reg2 : integer := 32;
begin
  bus0   <= reg0;
  bus1   <= reg1;
  addr32 <= reg2;
end architecture rtl;
