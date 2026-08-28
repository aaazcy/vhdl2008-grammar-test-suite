-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part with multiple statements variable_assignment+for_loop+return: inside the function body first assign a variable, then iterate with a for loop, finally return, verifies the coexistence of three kinds of sequential statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_loop_ent is port(v:in bit_vector(7 downto 0); cnt:out integer); end entity;
architecture bh of ssp_loop_ent is
  function f_ones(v:bit_vector(7 downto 0)) return integer is
    variable n:integer:=0;
  begin
    for i in v'range loop
      if v(i)='1' then n:=n+1; end if;
    end loop;
    return n;
  end function;
begin
  cnt<=f_ones(v);
end architecture bh;
