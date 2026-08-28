-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: condition missing after when - `exit when ;` follows the when keyword directly with a semicolon, missing the required condition expression
-- Expected Result: Triggers syntax error: condition expression missing after 'when'
-- Dependencies: None
-- =============================================================
entity exit_when_nocond_ent is
  port (stop : in bit; done : out bit);
end entity exit_when_nocond_ent;

architecture err of exit_when_nocond_ent is
begin
  process(stop) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      exit when;  -- ERROR: missing condition after 'when'
    end loop;
    done <= '1';
  end process;
end architecture err;
