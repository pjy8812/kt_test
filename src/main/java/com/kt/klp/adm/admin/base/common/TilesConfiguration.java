package com.kt.klp.adm.admin.base.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;
/**
*
* TilesConfiguration : 화면 레이아웃 설정
* <p>
*
* <pre>
* Modification Information·
* Modification date    Modifier Modification content    (수정일, 수정자, 수정내용)
* --------------------------------------------------
* 2022.01.12       Jungeun Cho     Initial creation
* </pre>
*
* @author IOUSOFT Jungeun Cho (josee@iousoft.co.kr)
* @since 2022.01.12
* @version 1.0.0
* @see
*
*/
@Configuration
public class TilesConfiguration {

    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();
        //해당 경로에 tiles.xml 파일을 넣음
        configurer.setDefinitions(new String[]{
        		"/WEB-INF/tiles/basic/tiles-layout.xml",
        		"/WEB-INF/tiles/basic/tiles-layout-no-side.xml",
        		"/WEB-INF/tiles/content-only/tiles-layout.xml",
				"/WEB-INF/tiles/content-only/tiles-layout-with-header.xml"
        });
        configurer.setCheckRefresh(true);
        return configurer;
    }

    @Bean
    public TilesViewResolver tilesViewResolver() {
        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
		tilesViewResolver.setOrder(1);
        return tilesViewResolver;
    }
}
