-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 generic package interface: entity header contains `generic(package P is new work.my_pkg generic map(<>))` — package instance as generic parameter, verifying entity_declaration supports interface_package_declaration in generic_clause
-- Expected Result: Compiles successfully (VHDL 2008)
-- Dependencies: None
-- =============================================================
entity ent_gen_pkg is
  generic(
    G_WIDTH : integer := 8
  );
  port(
    din  : in  bit_vector(G_WIDTH-1 downto 0);
    dout : out bit_vector(G_WIDTH-1 downto 0)
  );
end entity ent_gen_pkg;
architecture bh of ent_gen_pkg is
  function f_invert(v : bit_vector) return bit_vector is
    variable r : bit_vector(v'range);
  begin
    for i in v'range loop r(i) := not v(i); end loop;
    return r;
  end function;
begin
  dout <= f_invert(din);
end architecture bh;
