-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Positive
-- Test Focus: based_integer with extended_digit under multiple bases in the 3-15 range(3#210#, 7#654#, 9#887#, 14#D3C#): verify extended_digits within the corresponding range of each radix are all legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bi_varied_bases is
  port (
    v3  : out integer;
    v7  : out integer;
    v9  : out integer;
    v14 : out integer
  );
end entity bi_varied_bases;

architecture rtl of bi_varied_bases is
  constant C_B3  : integer := 3#210#;
  constant C_B7  : integer := 7#654#;
  constant C_B9  : integer := 9#887#;
  constant C_B14 : integer := 14#D3C#;
begin
  v3  <= C_B3;
  v7  <= C_B7;
  v9  <= C_B9;
  v14 <= C_B14;
end architecture rtl;
