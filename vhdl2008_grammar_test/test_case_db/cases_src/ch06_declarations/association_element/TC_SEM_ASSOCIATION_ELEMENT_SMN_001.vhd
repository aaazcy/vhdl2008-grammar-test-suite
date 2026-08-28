-- =============================================================
-- Case ID: TC_SEM_ASSOCIATION_ELEMENT_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ASSOCIATION_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_element ::= [ formal_part => ] actual_part
-- Case Type: Negative (Semantic)
-- Test Focus: association_element — SEMANTIC ERROR: the formal_part name
--             'data_bus' does not match any port of the instantiated
--             component (which has ports 'a' and 'y'). The syntax is
--             valid (named association with =>), but semantically the
--             formal_part must name an actual port of the component.
-- Expected Result: Triggers semantic/elaboration error (unknown port name)
-- Dependencies: None
-- =============================================================

entity association_element_smn1 is
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity association_element_smn1;

architecture arch of association_element_smn1 is

  component byte_latch is
    port (
      a : in  bit_vector(7 downto 0);
      y : out bit_vector(7 downto 0)
    );
  end component;

  signal s_data : bit_vector(7 downto 0);

begin

  -- SEMANTIC ERROR: 'data_bus' is not a port name of byte_latch.
  -- The component has ports 'a' and 'y', but the formal_part here
  -- references 'data_bus' which does not exist. The syntax is valid
  -- (formal_part => actual_part is a correct association_element),
  -- but the identifier 'data_bus' does not resolve to any port.
  u_latch : component byte_latch
    port map (
      data_bus => din,
      y        => s_data
    );

  dout <= s_data;

end architecture arch;
