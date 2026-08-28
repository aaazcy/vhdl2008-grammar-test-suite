-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part: three declarative items (subtype, constant, subprogram body) — exercises the repetition '{...}' operator in the BNF, showing that package_body_declarative_part can contain multiple items in sequence
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdp_three_items is
  port (
    d_in   : in  bit_vector(3 downto 0);
    d_out  : out bit_vector(3 downto 0);
    parity : out bit
  );
end entity;

architecture test of pbdp_three_items is
  -- Item 1: subtype_declaration
  subtype nibble_t is bit_vector(3 downto 0);
  -- Item 2: constant_declaration
  constant C_XOR_MASK : nibble_t := "1010";
  -- Item 3: subprogram_body
  function f_compute_parity(v : bit_vector) return bit is
    variable p : bit := '0';
  begin
    for i in v'range loop
      p := p xor v(i);
    end loop;
    return p;
  end function;

  signal s_data : nibble_t := "0000";
begin
  s_data <= d_in xor C_XOR_MASK;
  d_out  <= s_data;
  parity <= f_compute_parity(s_data);
end architecture test;
