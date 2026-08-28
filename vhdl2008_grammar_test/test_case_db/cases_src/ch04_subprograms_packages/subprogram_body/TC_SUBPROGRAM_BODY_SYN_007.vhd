-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: procedure body with case statement in subprogram_statement_part: case op is when... driving output inside procedure p_decode(signal op:in bit_vector(1 downto 0); signal r:out integer), verification that body can contain case branch statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_case_ent is port(op:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of sb_case_ent is
  procedure p_decode(signal opcode:in bit_vector(1 downto 0); signal result:out integer) is
  begin
    case opcode is
      when "00" => result<=10;
      when "01" => result<=20;
      when "10" => result<=30;
      when others => result<=0;
    end case;
  end procedure p_decode;
begin
  p_decode(op,y);
end architecture bh;
