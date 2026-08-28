-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: function body with multiple variables + for loop in subprogram_statement_part: declaration region contains variable declarations, body contains for loop iterating and returning accumulated value, verification of process-like execution semantics of subprogram_body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_loop_ent is port(inp:in bit_vector(7 downto 0); cnt:out integer); end entity;
architecture bh of sb_loop_ent is
  function f_popcount(v:bit_vector(7 downto 0)) return integer is
    variable result:integer:=0;
  begin
    for i in v'range loop
      if v(i)='1' then result:=result+1; end if;
    end loop;
    return result;
  end function f_popcount;
begin
  cnt<=f_popcount(inp);
end architecture bh;
