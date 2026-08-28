-- =============================================================
-- Case ID: TC_SEM_FORMAL_DESIGNATOR_SMN_001
-- Related Rule ID: SEM_FORMAL_DESIGNATOR_SMN_001
-- Rule Type: Semantic (Negative)
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Test Focus: Semantic error — a formal_designator in a port map refers to
--   a port name that does not exist in the component declaration. The name
--   "z" is not a port of the instantiated component, so it is an unresolved
--   formal designator. This is a semantic/elaboration error, not syntax.
-- Case Type: Negative (Semantic)
-- Expected Result: Triggers semantic/elaboration error (unknown formal port)
-- Dependencies: None
-- =============================================================

entity inverter is
  port (
    x : in  bit;
    y : out bit
  );
end entity inverter;

architecture rtl of inverter is
begin
  y <= not x;
end architecture rtl;

entity formal_desig_smn1 is
  port (
    inv_in  : in  bit;
    inv_out : out bit
  );
end entity formal_desig_smn1;

architecture struct of formal_desig_smn1 is
  component inverter is
    port (
      x : in  bit;
      y : out bit
    );
  end component inverter;
begin
  -- ERROR: "z" is not a port of component "inverter". The component's ports
  -- are x and y. Using "z" as a formal_designator causes a semantic error
  -- because no matching port name exists in the component declaration.
  u_inv : inverter
    port map (
      z => inv_in,   -- ERROR: "z" does not match any port of inverter
      y => inv_out
    );
end architecture struct;
