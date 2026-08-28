-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: no exit after the label colon - the label is written as `lbl: ;` lacking a complete exit statement body, verifying the exit keyword is required after a label
-- Expected Result: Triggers syntax error: expected 'exit' keyword after label
-- Dependencies: None
-- =============================================================
entity exit_label_only_ent is
  port (cnt : in integer; max : out integer);
end entity exit_label_only_ent;

architecture err of exit_label_only_ent is
begin
  process(cnt) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      early_out: ;  -- ERROR: label followed by empty, no exit
      v_i := 0;
    end loop;
    max <= v_i;
  end process;
end architecture err;
