-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: procedure declaration with mixed signal and variable parameters: procedure p_proc(signal a:in bit; variable b:out integer) - verification of multiple interface classes declared in subprogram_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_mixed is
  procedure p_decode(signal sel:in bit_vector(1 downto 0); signal result:out integer);
end package pkg_sd_mixed;
package body pkg_sd_mixed is
  procedure p_decode(signal sel:in bit_vector(1 downto 0); signal result:out integer) is
  begin
    case sel is
      when "00" => result<=0;
      when "01" => result<=1;
      when "10" => result<=2;
      when others => result<=3;
    end case;
  end procedure;
end package body pkg_sd_mixed;
entity sd_mixed_ent is port(op:in bit_vector(1 downto 0); r:out integer); end entity;
architecture bh of sd_mixed_ent is begin work.pkg_sd_mixed.p_decode(op,r); end architecture bh;
