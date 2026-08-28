-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon — newline directly after `next` with no semicolon, verifying that a next_statement must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing ';' after next statement
-- Dependencies: None
-- =============================================================
entity next_nosemi_ent is
  port (data : in bit; flag : out bit);
end entity next_nosemi_ent;

architecture err of next_nosemi_ent is
begin
  process(data) is
    variable v_i : integer := 0;
  begin
    for i in 0 to 7 loop
      next  -- ERROR: missing semicolon
      v_i := v_i + 1;
    end loop;
    flag <= '1';
  end process;
end architecture err;
