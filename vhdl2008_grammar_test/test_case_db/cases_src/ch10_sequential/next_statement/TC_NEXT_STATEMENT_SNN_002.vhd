-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing condition after when — `next when ;` is missing the required condition expression after the when keyword
-- Expected Result: Triggers syntax error: condition expression missing after 'when'
-- Dependencies: None
-- =============================================================
entity next_when_nocond_ent is
  port (en : in bit; done : out bit);
end entity next_when_nocond_ent;

architecture err of next_when_nocond_ent is
begin
  process(en) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      next when;  -- ERROR: missing condition after 'when'
      done <= '1';
    end loop;
  end process;
end architecture err;
