-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Negative
-- Test Focus: SNN: extra tokens after null — `null something;` has an illegal identifier after the null keyword, a null statement must contain only `null;`
-- Expected Result: Triggers syntax error: unexpected token after 'null'
-- Dependencies: None
-- =============================================================
entity null_extra_token_ent is
  port (val : in bit; result : out bit);
end entity null_extra_token_ent;

architecture err of null_extra_token_ent is
begin
  process(val) is
  begin
    null something;  -- ERROR: extra token after 'null' keyword
    result <= val;
  end process;
end architecture err;
