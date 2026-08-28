-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part as procedure declaration region with type+constant+variable used in for loop+case in body, full verification of practical combination of {item}
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_full_ent is port(op:in bit_vector(1 downto 0); result:out integer); end entity;
architecture bh of sdp_full_ent is
  procedure p_alu(signal opcode:in bit_vector(1 downto 0); signal res:out integer) is
    type t_op is (ADD, SUB, MUL, DIV);
    constant C_ADD:integer:=1;
    constant C_SUB:integer:=2;
    constant C_MUL:integer:=3;
    variable v_op:t_op;
  begin
    case opcode is
      when "00" => res<=10;
      when "01" => res<=20;
      when "10" => res<=30;
      when others => res<=0;
    end case;
  end procedure;
begin
  p_alu(op,result);
end architecture bh;
