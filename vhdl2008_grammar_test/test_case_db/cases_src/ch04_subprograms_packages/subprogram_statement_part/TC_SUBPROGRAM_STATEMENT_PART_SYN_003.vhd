-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part: for loop + while loop + null statement — exercises loops and null statement as sequential_statements within a procedure body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_stmt_loops is
  port (
    data   : in  bit_vector(7 downto 0);
    ones   : out natural;
    zeros  : out natural
  );
end entity;

architecture test of subprog_stmt_loops is
  procedure p_count_bits(signal d : in bit_vector; signal o, z : out natural) is
    variable v_ones  : natural := 0;
    variable v_zeros : natural := 0;
    variable v_idx   : natural := 0;
  begin
    -- sequential_statement: for loop
    for i in d'range loop
      if d(i) = '1' then
        v_ones := v_ones + 1;
      else
        v_zeros := v_zeros + 1;
      end if;
    end loop;

    -- sequential_statement: while loop + variable assignment
    v_idx := 0;
    while v_idx < v_ones loop
      v_idx := v_idx + 1;
    end loop;

    -- sequential_statement: null statement
    if v_ones + v_zeros = 8 then
      null;  -- valid: correctly computed
    end if;

    o <= v_ones;
    z <= v_zeros;
  end procedure;

  signal s_ones, s_zeros : natural := 0;
begin
  p_count_bits(data, s_ones, s_zeros);
  ones  <= s_ones;
  zeros <= s_zeros;
end architecture test;
