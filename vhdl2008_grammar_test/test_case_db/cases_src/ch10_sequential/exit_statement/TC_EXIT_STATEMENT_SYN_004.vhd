-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: With loop_label+when: `exit outer when cond;` - exits the outer loop with the named label and based on a condition, verifying the two optional clauses can be combined
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_label_when_ent is
  port (
    clk   : in  bit;
    limit : in  integer range 0 to 15;
    done  : out boolean
  );
end entity exit_label_when_ent;

architecture timeout of exit_label_when_ent is
begin
  process is
    variable v_tick : integer range 0 to 15 := 0;
  begin
    v_tick := 0;
    main: loop
      if clk'event and clk = '1' then
        v_tick := v_tick + 1;
      end if;
      exit main when v_tick >= limit;
      wait for 1 ns;
    end loop main;
    done <= true;
  end process;
end architecture timeout;
