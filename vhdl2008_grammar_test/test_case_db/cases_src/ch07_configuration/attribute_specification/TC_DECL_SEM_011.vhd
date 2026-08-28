-- =============================================================
-- Case ID: TC_DECL_SEM_011
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_011
-- Standard Reference: Chapter 7.2
-- Rule Summary: The entity specification in an attribute specification must reference a valid named entity
-- Case Type: Positive
-- Error Category: scope_visibility_error
-- Test Focus: Positive: the entity_specification of an attribute specification references legal visible named entities such as port(clk/rst/q), architecture(behav), signal(s_int) - verifying the entity_name_list of attribute_specification can reference declared entities of multiple entity_classes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Positive: Attribute specifications targeting valid, visible entities
entity sem_decl_011_ent is
  port (
    clk : in bit;
    rst : in bit;
    q   : out bit
  );

  -- Valid: targeting visible ports of the entity
  attribute attr_pin_num : integer;
  attribute attr_pin_num of clk : signal is 100;
  attribute attr_pin_num of rst : signal is 200;
  attribute attr_pin_num of q   : signal is 300;
end entity sem_decl_011_ent;

architecture behav of sem_decl_011_ent is
  attribute attr_syn_style : string;

  -- Valid: targeting the architecture
  attribute attr_syn_style of behav : architecture is "rtl";

  signal s_int : bit;
  -- Valid: targeting a locally declared signal
  attribute attr_pin_num of s_int : signal is 400;
begin
  q <= clk and rst;
end architecture behav;
