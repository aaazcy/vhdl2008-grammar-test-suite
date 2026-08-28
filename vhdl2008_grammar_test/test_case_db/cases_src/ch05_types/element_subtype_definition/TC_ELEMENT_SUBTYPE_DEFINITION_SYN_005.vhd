-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: element_subtype_definition with enumeration-based
--            subtype_indication. An instruction decoder ROM
--            indexed by opcode returning ALU operation codes.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity instruction_decoder is
  port (
    opcode   : in  bit_vector(2 downto 0);
    alu_op   : out integer range 0 to 7
  );
end entity instruction_decoder;

architecture rtl of instruction_decoder is
  type alu_operation is (ALU_ADD, ALU_SUB, ALU_AND, ALU_OR,
                         ALU_XOR, ALU_SLL, ALU_SRL, ALU_NOP);
  -- element_subtype_definition: enumeration subtype
  subtype valid_alu_op is alu_operation range ALU_ADD to ALU_NOP;
  type decode_rom is array (0 to 7) of valid_alu_op;
  constant decoder : decode_rom := (
    0 => ALU_ADD, 1 => ALU_SUB, 2 => ALU_AND, 3 => ALU_OR,
    4 => ALU_XOR, 5 => ALU_SLL, 6 => ALU_SRL, 7 => ALU_NOP
  );
  function to_int (b : bit_vector) return integer is
    variable r : integer := 0;
  begin
    for i in 0 to 2 loop
      if b(i) = '1' then r := r + 2**i; end if;
    end loop;
    return r;
  end function;
  signal op_enum : valid_alu_op;
begin
  op_enum <= decoder(to_int(opcode));
  process(op_enum)
  begin
    case op_enum is
      when ALU_ADD => alu_op <= 0;
      when ALU_SUB => alu_op <= 1;
      when ALU_AND => alu_op <= 2;
      when ALU_OR  => alu_op <= 3;
      when ALU_XOR => alu_op <= 4;
      when ALU_SLL => alu_op <= 5;
      when ALU_SRL => alu_op <= 6;
      when ALU_NOP => alu_op <= 7;
    end case;
  end process;
end architecture rtl;
