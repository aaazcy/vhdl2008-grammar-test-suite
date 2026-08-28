-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::=
--   interface_object_declaration
--   | interface_type_declaration
--   | interface_subprogram_declaration
--   | interface_package_declaration
-- Case Type: Positive
-- Test Focus: interface_declaration showing two alternatives:
--   interface_object_declaration (constant generic) and
--   interface_type_declaration (generic type) in an entity generic clause.
--   Exercises the VHDL-2008 generic type feature.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_decl_obj_and_type is
  generic (
    constant WIDTH : in positive := 16;
    type elem_type
  );
  port (
    clk    : in  bit;
    din    : in  bit_vector(WIDTH - 1 downto 0);
    dout   : out bit_vector(WIDTH - 1 downto 0);
    parity : out bit
  );
end entity iface_decl_obj_and_type;

architecture rtl of iface_decl_obj_and_type is
  function xor_reduce(v : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in v'range loop r := r xor v(i); end loop;
    return r;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      dout <= din;
      parity <= xor_reduce(din);
    end if;
  end process;
end architecture rtl;
