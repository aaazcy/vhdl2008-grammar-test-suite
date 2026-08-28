-- =============================================================
-- Case ID: TC_IDENTIFIER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_IDENTIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.4.2
-- Production: identifier ::= basic_identifier | extended_identifier
-- Case Type: Positive
-- Test Focus: Identifier starting with underscore — strictly basic_identifier cannot start with an underscore, testing lexer rejection or acceptance
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity id_underscore is
  port (
    val_out : out integer
  );
end entity id_underscore;

architecture rtl of id_underscore is
  constant C_TIMEOUT : integer := 100;
  signal ready_flag  : bit := '0';
begin
  ready_flag <= '1';
  val_out    <= C_TIMEOUT;
end architecture rtl;
