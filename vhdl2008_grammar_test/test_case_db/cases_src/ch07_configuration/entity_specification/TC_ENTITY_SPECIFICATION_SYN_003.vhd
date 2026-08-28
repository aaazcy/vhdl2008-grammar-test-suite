-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: Entity specification with "others" entity_name_list — exercises "others : signal" using "others" as the sole entity_name_list alternative with entity_class "signal", combined with "all : component" for contrast
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity espec_others_all is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of espec_others_all is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  attribute timing : time;
  signal s1, s2, s3 : bit := '0';
  attribute timing of others : signal is 1 ns;
  attribute timing of all : component is 2 ns;
begin
  u_and1 : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_and2 : gate_and port map(x1=>c, x2=>d, z=>y2);
  s1 <= a; s2 <= b; s3 <= c;
end architecture bh;
