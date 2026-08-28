-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: next when in a while loop — use a while conditional loop with next when to skip odd value processing, verifying the interaction of next in a while loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_while_loop_ent is
  port (
    input_val  : in  integer range 0 to 255;
    sum_even   : out integer range 0 to 1023
  );
end entity next_while_loop_ent;

architecture even_sum of next_while_loop_ent is
begin
  process(input_val) is
    variable v_i   : integer range 0 to 255 := 0;
    variable v_sum : integer range 0 to 1023 := 0;
  begin
    v_i := 0;
    v_sum := 0;
    while v_i < input_val loop
      v_i := v_i + 1;
      next when (v_i mod 2) = 1;  -- skip odd values
      v_sum := v_sum + v_i;
    end loop;
    sum_even <= v_sum;
  end process;
end architecture even_sum;
