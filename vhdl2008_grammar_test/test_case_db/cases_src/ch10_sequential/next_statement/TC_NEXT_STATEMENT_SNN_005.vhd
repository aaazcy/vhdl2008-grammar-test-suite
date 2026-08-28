-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: no next after label colon — label written as `lbl: ;` missing the complete next statement body, verifying that the next keyword must follow the label colon
-- Expected Result: Triggers syntax error: expected 'next' keyword after label
-- Dependencies: None
-- =============================================================
entity next_label_only_ent is
  port (cnt : in integer; max : out integer);
end entity next_label_only_ent;

architecture err of next_label_only_ent is
begin
  process(cnt) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      skip_iter: ;  -- ERROR: label followed by empty, no next
    end loop;
    max <= v_i;
  end process;
end architecture err;
