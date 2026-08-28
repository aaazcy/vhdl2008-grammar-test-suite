-- =============================================================
-- Case ID: TC_ATTRIBUTE_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: attribute_specification ::= attribute attribute_designator of entity_specification is expression ;
-- Case Type: Positive
-- Test Focus: attribute_specification on component+type+subtype entity classes — exercises entity_class entries: component, type, subtype with expression values of different types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity attr_spec_comp_type_ent is
  port(clk : in bit; data_in : in bit_vector(3 downto 0); data_out : out bit_vector(3 downto 0));
end entity;

architecture bh of attr_spec_comp_type_ent is
  component dff_4bit is
    port(clk : in bit; d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
  end component;
  type nibble_array is array(0 to 7) of bit_vector(3 downto 0);
  type nibble_kind is (valid_nibble, invalid_nibble);
  subtype nibble is bit_vector(3 downto 0);
  attribute info : string;
  attribute version : integer;
  attribute info of dff_4bit : component is "4-bit D flip-flop register";
  attribute version of nibble_kind : type is 2008;
  attribute info of nibble : subtype is "nibble subtype 4-bit";
  signal reg_val : nibble := "0000";
begin
  u_reg : dff_4bit port map(clk=>clk, d=>data_in, q=>data_out);
  reg_val <= data_in;
end architecture bh;
