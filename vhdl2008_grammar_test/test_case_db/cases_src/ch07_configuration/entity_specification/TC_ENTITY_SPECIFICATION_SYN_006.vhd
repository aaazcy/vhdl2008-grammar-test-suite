-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity_specification with entity_class "label" and comma-separated instantiation labels -- exercises entity_name_list as a comma-list of entity_designators (u_ff0, u_ff1) paired with entity_class "label" to attach attributes to multiple component instances by their instantiation labels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity espec_label_class is
  port(
    clk  : in  bit;
    d    : in  bit;
    q    : out bit
  );
end entity;

architecture structural of espec_label_class is
  component dff_reg is
    port(
      clock : in  bit;
      data  : in  bit;
      q_out : out bit
    );
  end component;

  attribute area_group : string;
  attribute area_group of u_ff0, u_ff1 : label is "shift_reg";

  signal s0 : bit := '0';
begin
  u_ff0 : dff_reg
    port map(clock => clk, data => d, q_out => s0);
  u_ff1 : dff_reg
    port map(clock => clk, data => s0, q_out => q);
end architecture structural;
