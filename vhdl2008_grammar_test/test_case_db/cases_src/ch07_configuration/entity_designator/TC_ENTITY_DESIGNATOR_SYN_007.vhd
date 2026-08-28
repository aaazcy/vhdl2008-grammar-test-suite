-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: entity_tag as label identifier in configuration specification -- exercises entity_designator where entity_tag is a component instantiation label (not a subprogram) used in a component configuration binding; no signature needed since labels are unique
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mux4to1 is
  port(
      data : in  bit_vector(3 downto 0);
      sel  : in  bit_vector(1 downto 0);
      y    : out bit
    );
end entity mux4to1;

architecture structural of mux4to1 is
begin
end architecture structural;


entity ed_label_tag is
  port(
    din  : in  bit_vector(3 downto 0);
    sel  : in  bit_vector(1 downto 0);
    dout : out bit
  );
end entity;

architecture rtl of ed_label_tag is
  component mux4to1 is
    port(
      data : in  bit_vector(3 downto 0);
      sel  : in  bit_vector(1 downto 0);
      y    : out bit
    );
  end component;

  -- entity_designator: entity_tag "u_mux" (an instantiation label, no signature)
  for u_mux : mux4to1
    use entity work.mux4to1(structural)
    port map(data => din, sel => sel, y => dout);

  attribute loc : string;
  attribute loc of u_mux : label is "X3Y2";

  signal d_buf : bit_vector(3 downto 0) := "0000";
  signal s_buf : bit_vector(1 downto 0) := "00";
begin
  d_buf <= din;
  s_buf <= sel;
  u_mux : mux4to1
    port map(data => d_buf, sel => s_buf, y => dout);
end architecture rtl;
