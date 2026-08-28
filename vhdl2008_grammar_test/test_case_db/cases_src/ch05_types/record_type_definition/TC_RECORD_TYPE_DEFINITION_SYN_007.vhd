-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record with fully constrained array fields of different sizes and directions, exercising element_declaration with constrained_array_definition subtypes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_arr_ent is port(r:out bit); end entity;
architecture rec_arr_arch of rec_arr_ent is
  type t_alu_op is record
    opcode  : bit_vector(3 downto 0);
    src_a   : bit_vector(7 downto 0);
    src_b   : bit_vector(7 downto 0);
    result  : bit_vector(7 downto 0);
    flags   : bit_vector(0 to 3);
  end record t_alu_op;
  signal s_op : t_alu_op := (
    opcode => "0000",
    src_a  => X"AA",
    src_b  => X"55",
    result => X"00",
    flags  => "0000"
  );
begin
  s_op.result <= s_op.src_a xor s_op.src_b;
  r <= s_op.flags(0);
end architecture rec_arr_arch;
