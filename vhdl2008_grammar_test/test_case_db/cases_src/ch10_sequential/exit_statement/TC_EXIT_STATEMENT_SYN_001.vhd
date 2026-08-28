-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: only the `exit;` keyword + semicolon, no label, no loop_label, no when condition - exits the innermost loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_minimal_ent is
  port (
    start  : in  bit;
    result : out integer range 0 to 15
  );
end entity exit_minimal_ent;

architecture rtl of exit_minimal_ent is
begin
  process(start) is
    variable v_cnt : integer range 0 to 15 := 0;
  begin
    v_cnt := 0;
    loop
      v_cnt := v_cnt + 1;
      if v_cnt >= 10 then
        exit;
      end if;
    end loop;
    result <= v_cnt;
  end process;
end architecture rtl;
