-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_specification ::= interface_procedure_specification | interface_function_specification
-- Case Type: Positive
-- Test Focus: choosing the procedure_specification alternative — a procedure with designator and full formal_parameter_list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ispec_syn1 is
  generic (
    procedure load ( signal addr : in integer; signal val : out bit_vector(7 downto 0) )
  );
  port (
    address : in  integer;
    data    : out bit_vector(7 downto 0)
  );
end entity ispec_syn1;

architecture bh of ispec_syn1 is
begin
  load(address, data);
end architecture bh;
