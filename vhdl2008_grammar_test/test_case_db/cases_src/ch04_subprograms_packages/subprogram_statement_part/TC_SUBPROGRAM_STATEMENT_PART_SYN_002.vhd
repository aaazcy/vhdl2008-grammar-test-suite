-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part: if/case/loop/variable_assignment/return — exercises five distinct sequential_statement types in sequence: variable assignment, if statement, case statement, for loop, and return statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_stmt_mixed is
  port (
    opcode : in  bit_vector(1 downto 0);
    a, b   : in  integer;
    result : out integer
  );
end entity;

architecture test of subprog_stmt_mixed is
  function f_alu(op : bit_vector(1 downto 0); x, y : integer) return integer is
    variable v_res : integer := 0;
  begin
    -- sequential_statement 1: variable assignment
    v_res := 0;

    -- sequential_statement 2: case statement
    case op is
      when "00"   => v_res := x + y;
      when "01"   => v_res := x - y;
      when "10"   => v_res := x * y;
      when others => v_res := x / y;
    end case;

    -- sequential_statement 3: if statement
    if v_res < 0 then
      v_res := -v_res;
    end if;

    -- sequential_statement 4: return statement
    return v_res;
  end function;
begin
  result <= f_alu(opcode, a, b);
end architecture test;
