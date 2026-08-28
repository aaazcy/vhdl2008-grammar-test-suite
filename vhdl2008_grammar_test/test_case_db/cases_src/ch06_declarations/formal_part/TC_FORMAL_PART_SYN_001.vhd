-- =============================================================
-- Case ID: TC_FORMAL_PART_SYN_001
-- Rule Type: Syntax
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator
--   | function_name ( formal_designator )
--   | type_mark ( formal_designator )
-- Test Focus: formal_part as formal_designator — the simplest syntactic form.
--   In a component instantiation port map, each formal_part is just a port
--   name identifier (formal_designator). This is the most common usage in
--   named association lists.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity xor_gate is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity xor_gate;

architecture rtl of xor_gate is
begin
  y <= a xor b;
end architecture rtl;

entity formal_part_syn1 is
  port (
    op1   : in  bit;
    op2   : in  bit;
    xor_y : out bit
  );
end entity formal_part_syn1;

architecture struct of formal_part_syn1 is
  component xor_gate is
    port (
      a : in  bit;
      b : in  bit;
      y : out bit
    );
  end component xor_gate;
begin
  -- Each formal_part is a formal_designator (port_name):
  --   a, b, y are all simple identifiers — the first BNF alternative.
  u_xor : xor_gate
    port map (
      a => op1,
      b => op2,
      y => xor_y
    );
end architecture struct;
