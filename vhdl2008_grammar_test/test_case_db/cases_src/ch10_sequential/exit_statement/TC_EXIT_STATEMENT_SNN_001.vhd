-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon - newline directly after `exit` with no semicolon, verifying exit_statement must end with a terminating semicolon
-- Expected Result: Triggers syntax error: missing ';' after exit statement
-- Dependencies: None
-- =============================================================
entity exit_nosemi_ent is
  port (trigger : in bit; flag : out bit);
end entity exit_nosemi_ent;

architecture err of exit_nosemi_ent is
begin
  process(trigger) is
    variable v_cnt : integer := 0;
  begin
    loop
      v_cnt := v_cnt + 1;
      exit  -- ERROR: missing semicolon
      v_cnt := 0;
    end loop;
    flag <= '1';
  end process;
end architecture err;
