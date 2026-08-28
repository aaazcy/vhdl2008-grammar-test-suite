-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Positive
-- Test Focus: procedure specification with 'is' box default (<>) — full declaration using box notation as default
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity isdecl_syn3 is
  generic (
    procedure emit ( signal data : out bit_vector(3 downto 0) ) is <>
  );
  port (
    dout : out bit_vector(3 downto 0)
  );
end entity isdecl_syn3;

architecture bh of isdecl_syn3 is
begin
  emit(dout);
end architecture bh;
