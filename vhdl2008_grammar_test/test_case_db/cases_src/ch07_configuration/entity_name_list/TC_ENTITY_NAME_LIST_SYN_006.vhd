-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Positive
-- Test Focus: entity_name_list with "all" applied to entity_class "component" -- exercises the "all" reserved-word alternative in a configuration specification that binds every unbound instance of a named component type; the entity_name_list "all" covers all instantiation labels of that component
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adder4 is
  port(
      op_a : in  bit_vector(3 downto 0);
      op_b : in  bit_vector(3 downto 0);
      sum  : out bit_vector(3 downto 0)
    );
end entity adder4;

architecture rtl of adder4 is
begin
end architecture rtl;


entity enl_all_component is
  port(
    a, b : in  bit_vector(3 downto 0);
    y    : out bit_vector(3 downto 0)
  );
end entity;

architecture structural of enl_all_component is
  component adder4 is
    port(
      op_a : in  bit_vector(3 downto 0);
      op_b : in  bit_vector(3 downto 0);
      sum  : out bit_vector(3 downto 0)
    );
  end component;

  -- entity_name_list "all" used in simple_configuration_specification
  for all : adder4
    use entity work.adder4(rtl)
    port map(op_a => op_a, op_b => op_b, sum => sum);

  signal a_r, b_r : bit_vector(3 downto 0) := "0000";
begin
  a_r <= a; b_r <= b;
  u_add : adder4
    port map(op_a => a_r, op_b => b_r, sum => y);
end architecture structural;
