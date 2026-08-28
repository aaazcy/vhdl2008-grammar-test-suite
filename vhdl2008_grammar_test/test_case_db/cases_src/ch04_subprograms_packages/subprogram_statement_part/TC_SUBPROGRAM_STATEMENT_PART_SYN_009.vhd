-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: subprogram_statement_part with case+return branch coverage: the case statement inside the function body contains when branches each with a return, verifies the use of case as a sequential statement in a subprogram
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_case_ent is port(op:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of ssp_case_ent is
  function f_decode(opcode:bit_vector(1 downto 0)) return integer is
  begin
    case opcode is
      when "00" => return 10;
      when "01" => return 20;
      when "10" => return 30;
      when others => return 0;
    end case;
  end function;
begin
  y<=f_decode(op);
end architecture bh;
