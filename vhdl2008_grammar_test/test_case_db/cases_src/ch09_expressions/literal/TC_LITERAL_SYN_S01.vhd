-- =============================================================
-- Case ID: TC_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: literal
-- IEEE Section: 9.3.3.1
-- BNF Text: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Test Focus: numeric literal integer usage for constant initialization and arithmetic in an ALU
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_literal_syn_s01 is
  port (
    a, b    : in  integer range 0 to 15;
    sum     : out integer range 0 to 31
  );
end entity tc_literal_syn_s01;

architecture alu of tc_literal_syn_s01 is
  constant C_OFFSET : integer := 5;  -- numeric literal in constant
begin
  sum <= a + b + C_OFFSET;
end architecture alu;
