-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: subprogram_specification: function_specification with pure keyword and return type_mark — exercises the 'function_specification' branch with explicit 'pure' qualifier and a named type_mark as the return type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity subprog_spec_pure_func is
  port (
    addr_in  : in  natural;
    data_out : out bit
  );
end entity;

architecture test of subprog_spec_pure_func is
  -- subprogram_specification ::= function_specification
  -- pure function designator ( params ) return type_mark
  pure function f_bit_at(n : natural) return bit is
  begin
    if (n mod 2) = 0 then
      return '0';
    else
      return '1';
    end if;
  end function;
begin
  data_out <= f_bit_at(addr_in);
end architecture test;
