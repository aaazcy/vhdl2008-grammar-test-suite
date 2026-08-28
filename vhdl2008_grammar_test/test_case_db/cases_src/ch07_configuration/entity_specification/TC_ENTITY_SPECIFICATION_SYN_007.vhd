-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity_specification with entity_class "component" and "all" entity_name_list -- exercises the combination of "all : component" in a configuration specification context where entity_class "component" identifies the design entity class for a component binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity half_adder is
  port (
      x    : in  bit;
      y    : in  bit;
      s    : out bit;
      c    : out bit
    );
end entity half_adder;

architecture rtl of half_adder is
begin
end architecture rtl;

entity espec_comp_class is
  port(
    a      : in  bit_vector(1 downto 0);
    b      : in  bit_vector(1 downto 0);
    sum    : out bit_vector(1 downto 0);
    carry  : out bit
  );
end entity;

architecture structural of espec_comp_class is
  component half_adder is
    port(
      x    : in  bit;
      y    : in  bit;
      s    : out bit;
      c    : out bit
    );
  end component;

  -- entity_class "component" with entity_name_list "all"
  for all : half_adder
    use entity work.half_adder(rtl)
    port map(x => a(0), y => b(0), s => sum(0), c => carry);

  signal c_int : bit := '0';
begin
  u_ha0 : half_adder
    port map(x => a(0), y => b(0), s => sum(0), c => c_int);
  u_ha1 : half_adder
    port map(x => a(1), y => b(1), s => sum(1), c => carry);
end architecture structural;
