-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon — newline directly after `null` with no semicolon, verifying that a null_statement must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing ';' after null statement
-- Dependencies: None
-- =============================================================
entity null_nosemi_ent is
  port (flag : in bit; out_sig : out bit);
end entity null_nosemi_ent;

architecture err of null_nosemi_ent is
begin
  process(flag) is
  begin
    if flag = '1' then
      null  -- ERROR: missing semicolon
    end if;
    out_sig <= flag;
  end process;
end architecture err;
